/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001931221845_0892944663_init();
    work_m_00000000000014299773_2525760129_init();
    work_m_00000000000010020934_1975616576_init();
    work_m_00000000000014299773_2409053120_init();
    work_m_00000000001931221845_2157395802_init();
    work_m_00000000000014299773_1030251687_init();
    work_m_00000000000010020934_3521698575_init();
    work_m_00000000000014299773_0611538406_init();
    work_m_00000000000890731273_3400988817_init();
    work_m_00000000002376553592_2367600360_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002376553592_2367600360");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
