<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\admin\controller;
use app\common\controller\Admin;

class Code extends Admin {
    public function _initialize() {
        parent::_initialize();
        $this->getContentMenu();
    }

	public function index() {
        $map  = array('status' => array('gt', -1));
        $list = db('Code')->where($map)->order('sort asc,id asc')->column('*', 'id');


        $this->assign('list', $list);

        $this->setMeta('防伪码列表');
        return $this->fetch();
	}
    /* 单字段编辑 */
    public function editable($name = null, $value = null, $pk = null) {
        if ($name && ($value != null || $value != '') && $pk) {
            db('Category')->where(array('id' => $pk))->setField($name, $value);
        }
    }

    /*批量生成 */
    public function add() {
        $Code = model('Code');

        if (IS_POST) {
            //提交表单
            $id = $Code->change();
            if (false !== $id) {
                action_log('update_category', 'category', $id, session('user_auth.uid'));
                return $this->success('新增成功！', url('index'));
            } else {
                $error = $Code->getError();
                return $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();

            /* 获取分类信息 */
            $this->assign('info', null);
            $this->assign('category', $cate);
            $this->setMeta('批量生成');
            return $this->fetch('add');
        }
    }
    /* 编辑 */
    public function edit($id = null) {
        if (IS_POST) {
            $category = model('Code');
            //提交表单
            $result = $category->change();
            if (false !== $result) {
                //记录行为
                action_log('update_code', 'code', $id, session('user_auth.uid'));
                return $this->success('导出成功！', url('index'));
            } else {
                $error = $category->getError();
                return $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {

            $info = $id ? db('Code')->find($id) : '';

            $this->assign('info', $info);

            $this->setMeta('详情');
            return $this->fetch();
        }
    }

    public function status() {
        $id     = $this->getArrayParam('id');
        $status = input('status', '0', 'trim,intval');

        if (!$id) {
            return $this->error("非法操作！");
        }

        $map['id'] = array('IN', $id);
        $result    = db('Code')->where($map)->setField('status', $status);
        if ($result) {
            return $this->success("设置成功！");
        } else {
            return $this->error("设置失败！");
        }
    }
    //导出
    public function export($id = NULL){


        $category = model('Code');

        //提交表单
        $result = $category->down($id);

        exit;
        if (false !== $result) {
            //记录行为
            action_log('update_code', 'code', $id, session('user_auth.uid'));
            return $this->success('导出成功！', url('index'));
        } else {
            $error = $category->getError();
            return $this->error(empty($error) ? '未知错误！' : $error);
        }
    }


}