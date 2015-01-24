package entities



import grails.test.mixin.*
import spock.lang.*

@TestFor(NationalHolidayController)
@Mock(NationalHoliday)
class NationalHolidayControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.nationalHolidayInstanceList
            model.nationalHolidayInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.nationalHolidayInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def nationalHoliday = new NationalHoliday()
            nationalHoliday.validate()
            controller.save(nationalHoliday)

        then:"The create view is rendered again with the correct model"
            model.nationalHolidayInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            nationalHoliday = new NationalHoliday(params)

            controller.save(nationalHoliday)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/nationalHoliday/show/1'
            controller.flash.message != null
            NationalHoliday.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def nationalHoliday = new NationalHoliday(params)
            controller.show(nationalHoliday)

        then:"A model is populated containing the domain instance"
            model.nationalHolidayInstance == nationalHoliday
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def nationalHoliday = new NationalHoliday(params)
            controller.edit(nationalHoliday)

        then:"A model is populated containing the domain instance"
            model.nationalHolidayInstance == nationalHoliday
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/nationalHoliday/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def nationalHoliday = new NationalHoliday()
            nationalHoliday.validate()
            controller.update(nationalHoliday)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.nationalHolidayInstance == nationalHoliday

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            nationalHoliday = new NationalHoliday(params).save(flush: true)
            controller.update(nationalHoliday)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/nationalHoliday/show/$nationalHoliday.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/nationalHoliday/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def nationalHoliday = new NationalHoliday(params).save(flush: true)

        then:"It exists"
            NationalHoliday.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(nationalHoliday)

        then:"The instance is deleted"
            NationalHoliday.count() == 0
            response.redirectedUrl == '/nationalHoliday/index'
            flash.message != null
    }
}
