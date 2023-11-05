local status, comment = pcall(require, 'Comment')

if (not status) then
    print('comments not installed')
    return
end

comment.setup{}
