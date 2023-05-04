SECTIONS {
    . = 0x80200000,
    kernel_entry = .;
    _s_kernel = .;

    _s_text_boot = .;
    _text_boot = .;
    .text.boot : {
        *(.text.boot)
    }
    _etext_boot = .;
    _e_text_boot = .;

    . = ALIGN(8);
    _text = .;
    _stest = .;
    _s_text = .; 
    .text : {
        *(.text)
    }
    . = ALIGN(4096);
    readonly_page = .;
    . += 4096;
    _e_text = .;
    _etext = .;

    _s_rodata = .;
    _rodata = .;
    .rodata : AT(ADDR(.rodata)) 
    {
        *(.rodata)
    }
    _e_rodata = .;
    _erodata = .;

    _s_data = .;
    _data = .;
    .data : {
        *(.data)
        . = ALIGN(4096);
        *(.data.init_task)
    }
    . = ALIGN(4096);
    idmap_pg_dir = .;
    . += 2 * 4096;
    idmap_pg_end = .;
	_edata = .;
    _e_data = .;

    . = ALIGN(0x8);
    _s_bss = .;
    _bss = .;
    .bss : {
        *(.bss*)
    }
    _e_bss = .;
    _e_kernel = .;
    _ebss = .;
	_end = .;
}