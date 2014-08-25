Week = function() {
    var self = this;

    self.init = function() {
        $(".day").on("dblclick", function(event) {
            var $cell = $(this);
            if ($cell.find("ul:visible").length > 0)
                self.toggle($cell);
            return false;
        });
        $(".cancel").on("click", function(event) {
            var $cell = $(this).parents("td");
            self.toggle($cell);
            return false;
        });
    };

    self.toggle = function($cell) {
        $cell.find("ul").toggle();
        $cell.find("form").toggle();
    }
}
