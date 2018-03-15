<?php
// +----------------------------------------------------------------------
// | SentCMS [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.tensent.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: molong <molong@tensent.cn> <http://www.tensent.cn>
// +----------------------------------------------------------------------

namespace app\common\model;

/**
* 设置模型
*/
class Code extends Base{

	protected $name = "Code";
	protected $auto = array('update_time', 'icon'=>1, 'status'=>1);

	protected $type = array(
		'icon'  => 'integer',
	);

	public function change(){
		$data = input('post.');
		if ($data['id']) {

			$result = $this->save($data,array('id'=>$data['id']));


		}else{
			unset($data['id']);
            $str = '';
            for ($i=0; $i < $data['num']; $i++) {//随机生成5个
                $str .= time().rand(100000,999999).",";
            }
            $data['content']= rtrim($str, ',');

            $result = $this->save($data);
		}
		if (false !== $result) {
			return true;
		}else{
			$this->error = "失败！";
			return false;
		}
	}

	public function info($id, $field = true){
		return $this->db()->where(array('id'=>$id))->field($field)->find();
	}

	public function down($id){
        $data = $this->db()->where(array('id'=>$id))->find();
        $data = explode(',',$data['content']);

        vendor("PHPExcel.PHPExcel");

        $objPHPExcel =  new \PHPExcel();
        $iofactory = new \PHPExcel_IOFactory();

        //设置excel列名
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1','防伪码');
        //$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B1','姓名');
        //$objPHPExcel->setActiveSheetIndex(0)->setCellValue('C1','年龄');
        //把数据循环写入excel中
        foreach($data as $key => $value){
            $key+=2;
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A'.$key,$value);
            //$objPHPExcel->setActiveSheetIndex(0)->setCellValue('B'.$key,$value['name']);
            //$objPHPExcel->setActiveSheetIndex(0)->setCellValue('C'.$key,$value['age']);
        }

        ob_end_clean();
        $objPHPExcel->getActiveSheet() -> setTitle('Excel'.time());
        $objPHPExcel-> setActiveSheetIndex(0);
        $objWriter = $iofactory -> createWriter($objPHPExcel, 'Excel5');

        $filename = iconv("utf-8", "gb2312",'Excel'.time().'.xls');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        header('Cache-Control: max-age=0');
        $objWriter -> save('php://output');
        exit;

    }

}