<riot-table-filter-boolean>
    <div class="filter">
        <div class="filter_active"><span>Active</span><input type="checkbox" name="_active" onclick="{clicked}"></div>
        <label for="{opts.as}">
            {opts.label}
            <input type="checkbox" name="{opts.as}" onclick="{clicked}">
        </label>
    </div>

    <script>
        this.mixin(EventHub);

        this.on('mount', function()
        {
            this[opts.as].checked = !!this.opts.value;
        });

        clicked(e)
        {
            if (this['_active'].checked)
            {
                this.observable.trigger('filter_on', opts.as, this);
            }
            else
            {
                this.observable.trigger('filter_off', opts.as);
            }
        }

        exec(data)
        {
            return data.filter(function(e)
            {
                if (this['_active'].checked)
                {
                    return e[this.opts.key] == this[opts.as].checked;
                }
                return true;
            }, this);
        }
    </script>
</riot-table-filter-boolean>
