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
    };

    self.toggle = function($cell) {
        $cell.find("ul").toggle();
        $cell.find("form").toggle();
    }
}
