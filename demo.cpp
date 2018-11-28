#include <iostream>
#include <stdlib.h>
#include "Line.h"

using namespace std;
/***************************/
/*对象成员
要求：
	定义两个类：
		坐标类：Coordinate
		数据成员：横坐标m_ix 纵坐标m_iy
		成员函数：构造函数/析构函数/封装函数/

		线段类：Line
		数据成员：点A m_coorA ，点B m_coorB
		成员函数：构造函数/析构函数/封装函数/信息打印函数
*/
/****************************/

int main(void)
{
	//Line *p = new Line();
	//delete p;
	//p = NULL;
	//			/*运行结果：
	//		构造Coordinate()
	//		构造Coordinate()
	//		构造Line()
//			析构~Line()
//			析构~Coordinate()
//			析构~Coordinate()*/

	Line *p = new Line(1,2,3,4);
	p->printInfo();
	delete p;
	p = NULL;
	system("pause");
	return 0;

}
