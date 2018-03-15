<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\index\controller;
use app\common\controller\Fornt;

class Index extends Fornt {

	//网站首页
	public function index() {
		//设置SEO
		$this->setSeo(config('web_site_title'), config('web_site_keyword'), config('web_site_description'));
		return $this->fetch();
	}
	//查询
	public function search(){
	    $code = $_REQUEST['code'];
        $res = db('document_photo')->where(array('code' => $code))->find();
        $res_t = db('document')->where(array('id'=>$res['doc_id']))->find();
        $data = array(
            array(
            "title"=>$res_t['title'],
            "code"=>$res['code']
            )
        );
        if($res){
            return json_encode(array('status'=>1,'msg'=>'查询成功','data'=>$data),true);
        }else{
            return json_encode(array('status'=>0,'msg'=>'您所查询的防伪码不存在，谨防假冒!'),true);
        }

    }


}
