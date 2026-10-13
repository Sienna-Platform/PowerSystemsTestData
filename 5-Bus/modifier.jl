function modify_sys!(sys::System)
    th = get_component(ThermalStandard, sys, "Park City")
    set_active_power_limits!(th, (min = 0.1, max = 1.7))
    set_status!(th, false)
    set_active_power!(th, 0.0)
    c = get_operation_cost(th)
    c.start_up = 1500
    c.shut_down = 75
    set_time_at_status!(th, 60.0)

    th = get_component(ThermalStandard, sys, "Alta")
    set_time_limits!(th, (up = 300.0, down = 60.0))
    set_active_power_limits!(th, (min = 0.05, max = 0.4))
    set_active_power!(th, 0.05)
    c = get_operation_cost(th)
    c.start_up = 400
    c.shut_down = 200
    set_time_at_status!(th, 120.0)

    th = get_component(ThermalStandard, sys, "Brighton")
    set_active_power_limits!(th, (min = 2.0, max = 6.0))
    c = get_operation_cost(th)
    set_active_power!(th, 4.88041)
    c.start_up = 5000
    c.shut_down = 3000

    th = get_component(ThermalStandard, sys, "Sundance")
    set_active_power_limits!(th, (min = 1.0, max = 2.0))
    set_time_limits!(th, (up = 300.0, down = 60.0))
    set_active_power!(th, 2.0)
    c = get_operation_cost(th)
    c.start_up = 4000
    c.shut_down = 2000
    set_time_at_status!(th, 60.0)

    th = get_component(ThermalStandard, sys, "Solitude")
    set_active_power_limits!(th, (min = 1.0, max = 5.2))
    set_ramp_limits!(th, (up = 0.0052, down = 0.0052))
    set_active_power!(th, 2.0)
    c = get_operation_cost(th)
    c.start_up = 3000
    c.shut_down = 1500
    return
end
