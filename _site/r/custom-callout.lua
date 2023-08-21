function Div(el)
    callouts = {'callout-tip', 'callout-note', 'callout-warning', 
              'callout-caution', 'callout-important'}
    for key, val in pairs(callouts) do
      if el.classes:includes(val) then
        el.attributes["collapse"] = 'true'
        return el
    end
  end
end 