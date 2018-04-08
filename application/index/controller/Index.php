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

		$list = db('ad')
            ->field('sent_ad.id,sent_ad.place_id,sent_ad.title,sent_ad.content,sent_ad.url,sent_picture.url as picurl')
            ->join('sent_picture','sent_ad.cover_id=sent_picture.id')
            ->where('sent_ad.place_id=1')
            ->select();
		$logo =  $this->getPage(1);
		$tel_select = $this->getPage(2);
		$smg_select = $this->getPage(3);
        $code_select = $this->getPage(4);
        $wechat_select = $this->getPage(5);
        $copyright = $this->getPage(6);
        $right = $this->getPage(7);

        $this->assign('list',$list);//广告列表
        $this->assign('logo',$logo);//logo
        $this->assign('tel_select',$tel_select);//电话查询
        $this->assign('smg_select',$smg_select);//短信查询
        $this->assign('code_select',$code_select);//二维码查询
        $this->assign('wechat_select',$wechat_select);//微信查询
        $this->assign('copyright',$copyright);//底部版权
        $this->assign('right',$right);//右侧悬浮

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

    /**公用的查询单页的内容
     * @param $id
     * @return mixed
     */
    public function getPage($id){
        $res= db('page')
            ->field('sent_page.id,sent_page.title,sent_page.content,sent_picture.url as picurl')
            ->join('sent_picture','sent_page.cover_id=sent_picture.id','left')
            ->where('sent_page.id='.$id)
            ->find();
        return $res;
    }


}
