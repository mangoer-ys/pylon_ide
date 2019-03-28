if exists("g:loaded_nerdtree_filter_menu")
    finish
endif
let g:loaded_nerdtree_filter_menu = 1


call NERDTreeAddMenuItem({
            \'text': '(f)Filter file''s extension', 
            \'shortcut': 'f', 
            \'callback': 'NERDTreeFilterExtension'})

function! NERDTreeFilterExtension()
    let input_ext = input("Please input the extension of files, use <space> to separate, such as「js json css」: ")
    let input_ext_list = split(input_ext)

    if input_ext_list != []
        let list = [] 
        for ext in input_ext_list
            let ext = '\.'.ext.'$'
            let extlist = split(ext)
            let list += extlist
        endfor
        let g:NERDTreeIgnore = list
    else
        let g:NERDTreeIgnore = ['\~$']
    endif
    call NERDTreeRender()
endfunction

