Week = function() {
    var self = this;

    self.init = function() {
        $(".day").on("dblclick", function(event) {
            var $cell = $(this);
            if ($cell.find("ul:visible").length > 0) {
                self.toggle($cell);
                $cell.find("textarea").focus();
            }
            return false;
        });
        $(".btn-danger").on("click", function(event) {
            var $cell = $(this).parents("div.cell");
            self.toggle($cell);
            return false;
        });
        $("#btn-add-row").on("click", function(event) {
            var name = prompt("Please enter a name for the new row.");
            var existingNames = $(".grade > .cell:not(.header)").map(function() { return $(this).text(); }).toArray();

            while (name == "") {
                name = prompt("Name cannot be blank.\nPlease enter a name for the new row.");
            }

            while (existingNames.indexOf(name) >= 0) {
                name = prompt("A row with that name already exists.\nPlease enter a different name for the new row.");
            }

            if (name == null)
                // User clicked cancel.
                return false;

            $("#add-row-name").val(name);
            $("#add-row-form").submit();
        });
    };

    self.toggle = function($cell) {
        $cell.find("ul").toggle();
        $cell.find("form").toggle();
    }
}
