#include <iostream>
#include <stdlib.h>
#include "Line.h"

using namespace std;
/***************************/
/*�����Ա
Ҫ��
	���������ࣺ
		�����ࣺCoordinate
		���ݳ�Ա��������m_ix ������m_iy
		��Ա���������캯��/��������/��װ����/

		�߶��ࣺLine
		���ݳ�Ա����A m_coorA ����B m_coorB
		��Ա���������캯��/��������/��װ����/��Ϣ��ӡ����
*/
/****************************/

int main(void)
{
	//Line *p = new Line();
	//delete p;
	//p = NULL;
	//			/*���н����
	//		����Coordinate()
	//		����Coordinate()
	//		����Line()
//			����~Line()
//			����~Coordinate()
//			����~Coordinate()*/

	Line *p = new Line(1,2,3,4);
	p->printInfo();
	delete p;
	p = NULL;
	system("pause");
	return 0;

}
